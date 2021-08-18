// Created for MagicSQL using MagicMaker [v.3.77.125.7055]

using MagicSQL;

namespace GPS
{
    public partial class CentroSalud : ISUD<CentroSalud>
    {
        public CentroSalud() : base(1)
        {
        } // base(SPs_Version)

        // Properties

        public int IdCentroSalud { get; set; }

        public int Numero { get; set; }

        public string Nombre { get; set; }

        public int? Zona { get; set; }

        public string Telefono { get; set; }
    }
}