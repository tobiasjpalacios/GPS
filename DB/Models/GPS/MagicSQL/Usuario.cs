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
    }
}