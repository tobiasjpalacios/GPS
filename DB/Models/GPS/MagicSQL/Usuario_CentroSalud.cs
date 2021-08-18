// Created for MagicSQL using MagicMaker [v.3.77.125.7055]

using MagicSQL;
using System;

namespace GPS
{
    public partial class Usuario_CentroSalud : ISUD<Usuario_CentroSalud>
    {
        public Usuario_CentroSalud() : base(1)
        {
        } // base(SPs_Version)

        // Properties

        public int IdUsuario_CentroSalud { get; set; }

        public int? IdUsuario { get; set; }

        public int? IdCentroSalud { get; set; }

        public DateTime? Alta { get; set; }

        public DateTime? Baja { get; set; }
    }
}