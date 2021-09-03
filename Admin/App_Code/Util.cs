using log4net;
using System;
using System.Drawing;
using System.IO;
using System.Net;
using System.Net.Mail;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.UI;

public static class Util
{
    public static readonly ILog Log = LogManager.GetLogger(System.Reflection.MethodBase.GetCurrentMethod().DeclaringType);

    #region Misc   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

    /// <summary>
    /// Devuelve el valor de una Key definida en la
    /// sección AppSettings del archivo .config
    /// </summary>
    /// <param name="key"></param>
    /// <returns></returns>
    public static string GetAppSetting(string key)
    {
        return System.Configuration.ConfigurationManager.AppSettings[key];
    }

    /// <summary>
    /// Recupera el valor de una propiedad de un objeto de tipo desconocido
    /// </summary>
    /// <param name="obj"></param>
    /// <param name="property"></param>
    /// <returns></returns>
    public static string GetPropertyValue(object obj, string property)
    {
        return obj.GetType().GetProperty(property).GetValue(obj, null).ToString();
    }

    /// <summary>
    /// Devuelve true si el valor es numérico.
    /// </summary>
    /// <param name="value"></param>
    /// <returns></returns>
    public static bool IsNumeric(string value)
    {
        float output;
        return float.TryParse(value, out output);
    }

    /// <summary>
    /// Devuelve un string para ser utilizado como nombre de archivo descargado eliminando caracteres especiales
    /// </summary>
    /// <param name="fileName"></param>
    /// <returns></returns>
    public static string DownloadFileName(string fileName)
    {
        if (fileName.Trim() == "")
        {
            fileName = "Archivo";
        }
        return HttpUtility.UrlEncode(fileName).Replace("+", " ").Trim();
    }

    /// <summary>
    /// Devuelve un string decodificado a partir de un string con codificación HTML.
    /// </summary>
    /// <param name="encodedHTML"></param>
    /// <returns></returns>
    public static string HtmlDecode(string encodedHTML)
    {
        return WebUtility.HtmlDecode(encodedHTML);
    }

    /// <summary>
    /// Recupera el HTML a partir de una URL.
    /// </summary>
    /// <param name="url"></param>
    /// <returns></returns>
    public static string GetHtmlFromURL(string url)
    {
        HttpWebRequest httpWebRequest = (HttpWebRequest)WebRequest.Create(url);

        // Proxy
        if (GetAppSetting("Proxy").ToBool())
        {
            string proxyHost = GetAppSetting("Proxy.Host");
            int proxyPort = GetAppSetting("Proxy.Port").ToInt();
            httpWebRequest.Proxy = new System.Net.WebProxy(proxyHost, proxyPort);
        }

        HttpWebResponse httpWebResponse = (HttpWebResponse)httpWebRequest.GetResponse();

        if (httpWebResponse.StatusCode == HttpStatusCode.OK)
        {
            Stream stream = httpWebResponse.GetResponseStream();
            StreamReader streamReader;

            if (string.IsNullOrWhiteSpace(httpWebResponse.CharacterSet))
                streamReader = new StreamReader(stream);
            else
                streamReader = new StreamReader(stream, Encoding.GetEncoding(httpWebResponse.CharacterSet));

            string html = streamReader.ReadToEnd();

            httpWebResponse.Close();
            streamReader.Close();

            return html;
        }
        else
        {
            return "";
        }
    }

    /// <summary>
    /// Formatea el CUIL agregando los guiones.
    /// </summary>
    /// <param name="cuil"></param>
    /// <returns></returns>
    public static string FormatCUIL(string cuil)
    {
        if (cuil != null)
        {
            if (cuil.Length == 11)
            {
                return cuil.Substring(0, 2) + "-" + cuil.Substring(2, 8) + "-" + cuil.Substring(10, 1);
            }
            else
            {
                return "Inválido";
            }
        }
        else
        {
            return "Inválido";
        }
    }

    /// <summary>
    /// Envía un correo electrónico utilizando los parámetros indicados en el archivo .config.
    /// </summary>
    /// <param name="from"></param>
    /// <param name="displayName"></param>
    /// <param name="to"></param>
    /// <param name="subject"></param>
    /// <param name="body"></param>
    public static bool SendMail(string from, string displayName, string to, string subject, string body)
    {
        try
        {
            SmtpClient smtpClient = new SmtpClient
            {
                Host = GetAppSetting("SMTP.Host"),
                Port = GetAppSetting("SMTP.Port").ToInt(),
                Credentials = new NetworkCredential(GetAppSetting("SMTP.Username"), GetAppSetting("SMTP.Password")),
                EnableSsl = GetAppSetting("SMTP.SSL").ToBool()
            };

            MailMessage mailMessage = new MailMessage
            {
                From = new MailAddress(from, displayName)
            };
            mailMessage.To.Add(new MailAddress(to));
            mailMessage.Subject = subject;
            mailMessage.Body = body;
            mailMessage.IsBodyHtml = true;

            smtpClient.Send(mailMessage);

            return true;
        }
        catch (Exception ex)
        {
            Util.Log.Error("SendMail: " + ex);

            return false;
        }
    }

    public static string FK(string errMsg)
    {
        if (errMsg.IndexOf(" \"FK_") > 0)
        {
            int i = errMsg.IndexOf("FK_");
            int j = errMsg.IndexOf("\"", i + 1);
            string fk = errMsg.Substring(i, j - i);
            return fk;
        }
        else
        {
            return "";
        }
    }

    #endregion Misc   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

    #region Navigation   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

    /// <summary>
    /// Devuelve la URL de base.
    /// </summary>
    /// <returns></returns>
    public static string GetBaseURL()
    {
        return HttpContext.Current.Request.Url.Scheme + "://" + HttpContext.Current.Request.Url.Authority + HttpContext.Current.Request.ApplicationPath.TrimEnd('/') + "/";
    }

    /// <summary>
    /// Devuelve el nombre del WebForm actual.
    /// </summary>
    /// <returns></returns>
    public static string GetCurrentPageName()
    {
        string path = HttpContext.Current.Request.Url.AbsolutePath;
        FileInfo fileInfo = new FileInfo(path);
        return fileInfo.Name;
    }

    /// <summary>
    /// Devuelve la URL actual.
    /// </summary>
    /// <returns></returns>
    public static string GetRequestedURL()
    {
        return HttpContext.Current.Request.Url.AbsoluteUri;
    }

    /// <summary>
    /// Devuelve la IP del cliente remoto.
    /// </summary>
    /// <returns></returns>
    public static string GetRequestIPAddress()
    {
        HttpContext httpContext = HttpContext.Current;
        string ipAddress = httpContext.Request.ServerVariables["HTTP_X_FORWARDED_FOR"];
        if (!string.IsNullOrEmpty(ipAddress))
        {
            string[] addresses = ipAddress.Split(',');
            if (addresses.Length != 0)
            {
                return addresses[0];
            }
        }
        return httpContext.Request.ServerVariables["REMOTE_ADDR"];
    }

    /// <summary>
    /// Reemplaza Response.Redirect y completa el request.
    /// </summary>
    /// <param name="url"></param>
    public static void GoTo(string url)
    {
        HttpContext.Current.Response.Redirect(url, false);
        HttpContext.Current.ApplicationInstance.CompleteRequest();
    }

    /// <summary>
    /// Recarga la página actual.
    /// </summary>
    public static void Reload()
    {
        Page page = HttpContext.Current.Handler as Page;
        GoTo(page.Request.Url.ToString());
    }

    #endregion Navigation   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

    #region Images   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

    /// <summary>
    /// Devuelve una imagen en formato byte array.
    /// </summary>
    /// <param name="imageFile"></param>
    /// <returns></returns>
    public static byte[] GetBytesFromImageFolderFile(string imageFile)
    {
        MemoryStream memoryStream = new MemoryStream();
        Image image = Image.FromFile(HttpContext.Current.Server.MapPath("~") + "\\Images\\" + imageFile);
        image.Save(memoryStream, System.Drawing.Imaging.ImageFormat.Jpeg);
        return memoryStream.ToArray();
    }

    /// <summary>
    /// Devuelve una imagen en Base64.
    /// (Para valuar la propiedad ImageUrl de un control asp:Image)
    /// </summary>
    /// <param name="imageBytes"></param>
    /// <returns></returns>
    public static string GetBase64FromImageBytes(byte[] imageBytes)
    {
        if (imageBytes != null)
        {
            return "data:image;base64," + Convert.ToBase64String(imageBytes);
        }
        else
        {
            return "data:image;base64," + Convert.ToBase64String(Util.GetBytesFromImageFolderFile("no-image.png"));
        }
    }

    /// <summary>
    /// Devuelve una imagen a partir de un string en Base64
    /// </summary>
    /// <param name="base64Image"></param>
    /// <returns></returns>
    public static Image GetImageFromBase64(string base64Image)
    {
        byte[] bytes = Convert.FromBase64String(base64Image);
        Image image;
        using (MemoryStream ms = new MemoryStream(bytes))
        {
            image = Image.FromStream(ms);
        }
        return image;
    }

    #endregion Images   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

    #region Cookies   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

    /// <summary>
    /// Create una Cookie.
    /// </summary>
    /// <param name="cookieName"></param>
    /// <param name="value"></param>
    /// <param name="expiration"></param>
    public static void CreateCookie(string cookieName, string value, DateTime? expiration = null)
    {
        DateTime expires = DateTime.Now.AddDays(1);
        if (expiration != null)
        {
            expires = expiration.ToString().ToDateTime();
        }
        HttpCookie httpCookie = new HttpCookie(cookieName)
        {
            // establece el valor de la cookie
            Value = value,

            // establece la fecha de expiracion de la cookie
            Expires = expires
        };

        // agrega la cookie
        HttpContext.Current.Response.Cookies.Add(httpCookie);
    }

    /// <summary>
    /// Lee una Cookie.
    /// </summary>
    /// <param name="cookieName"></param>
    /// <returns></returns>
    public static string ReadCookie(string cookieName)
    {
        // recupera la cookie del request
        HttpCookie httpCookie = HttpContext.Current.Request.Cookies[cookieName];

        string value = null;
        if (httpCookie != null)
        {
            // lee el valor de la cookie
            value = httpCookie.Value;
        }

        return value;
    }

    /// <summary>
    /// Elimina una Cookie.
    /// </summary>
    /// <param name="cookieName"></param>
    public static void DeleteCookie(string cookieName)
    {
        HttpCookie httpCookie = new HttpCookie(cookieName)
        {
            // establece el valor de la cookie
            Value = "",

            // establece la fecha de expiracion de la cookie
            Expires = DateTime.Now.AddDays(-365)
        };

        // agrega la cookie
        HttpContext.Current.Response.Cookies.Add(httpCookie);
    }

    #endregion Cookies   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

    #region JavaScript   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

    /// <summary>
    /// Ejecuta una función JavaScript en el navegador.
    /// </summary>
    /// <param name="functionName"></param>
    /// <param name="parameters"></param>
    public static void ExecJsFn(string functionName, string parameters = "")
    {
        Page page = HttpContext.Current.CurrentHandler as Page;
        if (page != null)
        {
            Guid key = Guid.NewGuid();
            ScriptManager.RegisterStartupScript(page, page.GetType(), key.ToString(), functionName + "(" + parameters + ");\n", true);
        }
    }

    /// <summary>
    /// Ejecuta una función JavaScript en el navegador.
    /// </summary>
    /// <param name="functionName"></param>
    /// <param name="parameters"></param>
    public static void ExecJsFn(string functionName, object parameters)
    {
        Page page = HttpContext.Current.CurrentHandler as Page;
        if (page != null)
        {
            Guid key = Guid.NewGuid();
            ScriptManager.RegisterStartupScript(page, page.GetType(), key.ToString(), functionName + "(" + parameters + ");\n", true);
        }
    }

    /// <summary>
    /// Ejecuta un script JavaScript en el navegador.
    /// </summary>
    /// <param name="script"></param>
    public static void ExecJsScript(string script)
    {
        Page page = HttpContext.Current.CurrentHandler as Page;
        if (page != null)
        {
            Guid key = Guid.NewGuid();
            ScriptManager.RegisterStartupScript(page, page.GetType(), key.ToString(), script + "\n", true);
        }
    }

    /// <summary>
    /// Tipos de mensajes SweetAlet2.
    /// </summary>
    public enum MessagesTypes
    {
        info,
        question,
        success,
        warning,
        error
    }

    /// <summary>
    /// Muestra un mensaje en el navegador utilizando SweetAlert.
    /// </summary>
    /// <param name="title"></param>
    /// <param name="html"></param>
    /// <param name="messageType"></param>
    /// <param name="redirectTo"></param>
    /// <param name="timeout"></param>
    public static void Message(string title, string html, MessagesTypes messageType, string redirectTo = "", int timeout = 0)
    {
        html = html.Replace("'", @"\'");
        html = html.Replace("\r\n", "<br>");

        Page page = HttpContext.Current.CurrentHandler as Page;
        if (page != null)
        {
            string jsFnCode = @"setTimeout(function(){Swal.fire({
    title: '{0}',
    html: '{1}',
    type: '{2}',
    confirmButtonText: 'Aceptar',
    confirmButtonColor: '{3}'
})";
            if (redirectTo.Equals(""))
            {
                jsFnCode = jsFnCode + ";}, " + timeout + ");";
            }
            else
            {
                jsFnCode = jsFnCode + @"
.then((result) => {
    window.location.href = '{4}';
});}, " + timeout + ");";
            }

            string buttonColor = "";
            switch (messageType)
            {
                case MessagesTypes.info:
                    buttonColor = "#63c2de";
                    break;

                case MessagesTypes.question:
                    buttonColor = "#20a8d8";
                    break;

                case MessagesTypes.success:
                    buttonColor = "#4dbd74";
                    break;

                case MessagesTypes.warning:
                    buttonColor = "#ffc107";
                    break;

                case MessagesTypes.error:
                    buttonColor = "#f86c";
                    break;
            }
            jsFnCode = jsFnCode.Replace("{0}", title).Replace("{1}", html).Replace("{2}", messageType.ToString()).Replace("{3}", buttonColor).Replace("{4}", redirectTo);
            Guid key = Guid.NewGuid();
            ScriptManager.RegisterStartupScript(page, page.GetType(), key.ToString(), jsFnCode, true);
        }
    }

    /// <summary>
    /// Muestra una página dentro del un Modal.
    /// </summary>
    /// <param name="title"></param>
    /// <param name="url"></param>
    public static void PopUp(string url)
    {
        string script = "$('#iPopUp').attr('src', '" + url + "');" +
                        "$('#mdlPopUp').modal('show');";

        ExecJsScript(script);
    }

    /// <summary>
    /// Abre el cuadro de diálogo imprimir mostrando la ULR indicada.
    /// </summary>
    /// <param name="url"></param>
    public static void Print(string url)
    {
        Page page = HttpContext.Current.CurrentHandler as Page;
        if (page != null)
        {
            string jsFnCode = @"function Print() {
    var printWindow = window.open('{0}');
    printWindow.addEventListener('load', function () {
        printWindow.print();
        printWindow.close();
    }, true);
}
setTimeout(Function('Print();'), 100);";
            jsFnCode = jsFnCode.Replace("{0}", url);
            Guid key = Guid.NewGuid();
            ScriptManager.RegisterStartupScript(page, page.GetType(), key.ToString(), jsFnCode, true);
        }
    }


    #endregion JavaScript   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

    #region Cryptography & Security   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---

    private enum HashType
    {
        Md5,
        Sha1,
        Sha256,
        Sha384,
        Sha512
    }

    /// <summary>
    /// Calcula el hash MD5. Devuelve 32 caracteres.
    /// </summary>
    /// <param name="input"></param>
    /// <returns></returns>
    public static string GetHashMd5(this string input)
    {
        return ComputeHash(HashType.Md5, input);
    }

    /// <summary>
    /// Calcula el hash SHA-1. Devuelve 40 caracteres.
    /// </summary>
    /// <param name="input"></param>
    /// <returns></returns>
    public static string GetHashSha1(this string input)
    {
        return ComputeHash(HashType.Sha1, input);
    }

    /// <summary>
    /// Calcula el hash SHA-256. Devuelve 64 caracteres.
    /// </summary>
    /// <param name="input"></param>
    /// <returns></returns>
    public static string GetHashSha256(this string input)
    {
        return ComputeHash(HashType.Sha256, input);
    }

    /// <summary>
    /// Calcula el hash SHA-384. Devuelve 96 caracteres.
    /// </summary>
    /// <param name="input"></param>
    /// <returns></returns>
    public static string GetHashSha384(this string input)
    {
        return ComputeHash(HashType.Sha384, input);
    }

    /// <summary>
    /// Calcula el hash SHA-512. Devuelve 128 caracteres.
    /// </summary>
    /// <param name="input"></param>
    /// <returns></returns>
    public static string GetHashSha512(this string input)
    {
        return ComputeHash(HashType.Sha512, input);
    }

    /// <summary>
    /// Calcula el Hash.
    /// </summary>
    /// <param name="hashType"></param>
    /// <param name="input"></param>
    /// <returns></returns>
    private static string ComputeHash(HashType hashType, string input)
    {
        if (input == null)
        {
            throw new ArgumentNullException("input");
        }

        HashAlgorithm hashAlgorithm = GetHasher(hashType);
        byte[] inputBytes = Encoding.UTF8.GetBytes(input);

        byte[] hashBytes = hashAlgorithm.ComputeHash(inputBytes);
        StringBuilder stringBuilder = new StringBuilder();
        foreach (byte b in hashBytes)
        {
            stringBuilder.Append(string.Format("{0:x2}", b));
        }

        return stringBuilder.ToString();
    }

    /// <summary>
    /// Tipo de hasher.
    /// </summary>
    /// <param name="hashType"></param>
    /// <returns></returns>
    private static HashAlgorithm GetHasher(HashType hashType)
    {
        switch (hashType)
        {
            case HashType.Md5:
                return new MD5CryptoServiceProvider();

            case HashType.Sha1:
                return new SHA1Managed();

            case HashType.Sha256:
                return new SHA256Managed();

            case HashType.Sha384:
                return new SHA384Managed();

            case HashType.Sha512:
                return new SHA512Managed();

            default:
                throw new ArgumentOutOfRangeException("hashType");
        }
    }

    /// <summary>
    /// Encripta una cadena de caracteres utilizando AES.
    /// </summary>
    /// <param name="decryptedText"></param>
    /// <returns></returns>
    public static string Encrypt(string decryptedText)
    {
        string aesKey = GetAppSetting("AES.Key");
        byte[] decryptedBytes = Encoding.UTF8.GetBytes(decryptedText);
        return Convert.ToBase64String(Encrypt(decryptedBytes, GetRijndaelManaged(aesKey))).Replace("+", "-").Replace("/", "_");
    }

    /// <summary>
    /// Desencripta una cadena de caracteres utilizando AES.
    /// </summary>
    /// <param name="encryptedText"></param>
    /// <returns></returns>
    public static string Decrypt(string encryptedText)
    {
        string aesKey = GetAppSetting("AES.Key");
        encryptedText = encryptedText.Replace("-", "+");
        encryptedText = encryptedText.Replace("_", "/");
        int i = encryptedText.IndexOf(";");
        if (i != -1)
        {
            encryptedText = encryptedText.Substring(0, i);
        }
        byte[] encryptedBytes = Convert.FromBase64String(encryptedText);
        return Encoding.UTF8.GetString(Decrypt(encryptedBytes, GetRijndaelManaged(aesKey))).Replace('\0', ' ').TrimEnd();
    }

    /// <summary>
    /// Encriptador.
    /// </summary>
    /// <param name="decryptedBytes"></param>
    /// <param name="rijndaelManaged"></param>
    /// <returns></returns>
    private static byte[] Encrypt(byte[] decryptedBytes, RijndaelManaged rijndaelManaged)
    {
        return rijndaelManaged.CreateEncryptor().TransformFinalBlock(decryptedBytes, 0, decryptedBytes.Length);
    }

    /// <summary>
    /// Desencriptador.
    /// </summary>
    /// <param name="encryptedData"></param>
    /// <param name="rijndaelManaged"></param>
    /// <returns></returns>
    private static byte[] Decrypt(byte[] encryptedData, RijndaelManaged rijndaelManaged)
    {
        return rijndaelManaged.CreateDecryptor().TransformFinalBlock(encryptedData, 0, encryptedData.Length);
    }

    /// <summary>
    /// Implementación del algoritmo Rijndael.
    /// </summary>
    /// <param name="secretKey"></param>
    /// <returns></returns>
    private static RijndaelManaged GetRijndaelManaged(string secretKey)
    {
        byte[] keyBytes = new byte[16];
        byte[] secretKeyBytes = Encoding.UTF8.GetBytes(secretKey);
        Array.Copy(secretKeyBytes, keyBytes, Math.Min(keyBytes.Length, secretKeyBytes.Length));
        return new RijndaelManaged
        {
            Mode = CipherMode.CBC,
            Padding = PaddingMode.PKCS7,
            KeySize = 128,
            BlockSize = 128,
            Key = keyBytes,
            IV = keyBytes
        };
    }

    /// <summary>
    /// Genera una contraseña (sencilla) aleatoria.
    /// </summary>
    /// <param name="length"></param>
    /// <returns></returns>
    public static string GeneratePassword(int length)
    {
        const string valid = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890";
        StringBuilder stringBuilder = new StringBuilder();
        Random rnd = new Random();
        while (0 < length--)
        {
            stringBuilder.Append(valid[rnd.Next(valid.Length)]);
        }
        return stringBuilder.ToString();
    }

    #endregion Cryptography & Security   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---
}