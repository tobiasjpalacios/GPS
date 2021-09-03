// Created for MagicSQL using MagicMaker [v.3.77.125.7055]

using System;
using MagicSQL;

namespace GPS
{
    public partial class CentroSalud_Proyecto : ISUD<CentroSalud_Proyecto>
    {
        public CentroSalud_Proyecto() : base(2) { } // base(SPs_Version)

        // Properties

        public int IdCentroSalud_Proyecto { get; set; }

        public DateTime Alta { get; set; }

        public DateTime? Baja { get; set; }

        public int IdCentroSalud { get; set; }

        public int IdProyecto { get; set; }
    }
}