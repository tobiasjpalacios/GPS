// Created for MagicSQL using MagicMaker [v.3.77.125.7055]

using System;
using MagicSQL;

namespace GPS
{
    public partial class CentroSalud : ISUD<CentroSalud>
    {
        public CentroSalud() : base(2) { } // base(SPs_Version)

        // Properties

        public int IdCentroSalud { get; set; }

        public DateTime Alta { get; set; }

        public DateTime? Baja { get; set; }

        public int Numero { get; set; }

        public string Nombre { get; set; }

        public int? Zona { get; set; }

        public string Telefono { get; set; }
    }
}