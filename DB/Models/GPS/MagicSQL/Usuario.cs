// Created for MagicSQL using MagicMaker [v.3.77.125.7055]

using System;
using MagicSQL;

namespace GPS
{
    public partial class Usuario : ISUD<Usuario>
    {
        public Usuario() : base(2) { } // base(SPs_Version)

        // Properties

        public int IdUsuario { get; set; }

        public DateTime Alta { get; set; }

        public DateTime? Baja { get; set; }

        public string Username { get; set; }

        public string Password { get; set; }

        public string Telefono { get; set; }

        public string Email { get; set; }

        public string NumeroDocumento { get; set; }

        public string Sexo { get; set; }

        public long? IdTramitePrincipal { get; set; }

        public long? IdTramiteTarjetaImpresa { get; set; }

        public string Ejemplar { get; set; }

        public string Vencimiento { get; set; }

        public string Emision { get; set; }

        public string Apellido { get; set; }

        public string Nombres { get; set; }

        public string FechaNacimiento { get; set; }

        public string CUIL { get; set; }

        public string Calle { get; set; }

        public string Numero { get; set; }

        public string Piso { get; set; }

        public string Departamento { get; set; }

        public string CP { get; set; }

        public string Barrio { get; set; }

        public string Monoblock { get; set; }

        public string Ciudad { get; set; }

        public string Municipio { get; set; }

        public string Pais { get; set; }

        public string MensaF { get; set; }

        public string OrigenF { get; set; }

        public string FechaF { get; set; }

        public byte[] Foto { get; set; }

        public string FechaConsulta { get; set; }

        public string IdCiudadano { get; set; }

        public string DescripcionError { get; set; }

        public long? CodigoError { get; set; }

        public string ErrorResult { get; set; }

        public string ErrorMessage { get; set; }
    }
}