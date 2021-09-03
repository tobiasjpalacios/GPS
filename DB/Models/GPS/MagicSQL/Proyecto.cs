// Created for MagicSQL using MagicMaker [v.3.77.125.7055]

using System;
using MagicSQL;

namespace GPS
{
    public partial class Proyecto : ISUD<Proyecto>
    {
        public Proyecto() : base(3) { } // base(SPs_Version)

        // Properties

        public int IdProyecto { get; set; }

        public DateTime Alta { get; set; }

        public DateTime? Baja { get; set; }

        public string Nombre { get; set; }

        public int? IdCentroSalud { get; set; }
    }
}