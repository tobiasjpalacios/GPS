// Created for MagicSQL using MagicMaker [v.3.77.125.7055]

using MagicSQL;
using System;

namespace GPS
{
    public partial class Proyecto_Usuario : ISUD<Proyecto_Usuario>
    {
        public Proyecto_Usuario() : base(2)
        {
        } // base(SPs_Version)

        // Properties

        public int IdProyecto_Usuario { get; set; }

        public DateTime Alta { get; set; }

        public DateTime? Baja { get; set; }

        public int IdProyecto { get; set; }

        public int IdUsuario { get; set; }
    }
}