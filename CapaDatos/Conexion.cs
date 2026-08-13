using System;
using System.Configuration;

namespace CapaDatos
{
    public class Conexion
    {
        public static string cn;

        static Conexion()
        {
            try
            {
                cn = ConfigurationManager.ConnectionStrings["cadena"].ConnectionString;
            }
            catch (Exception ex)
            {
                throw new Exception("Error al leer la cadena de conexión: " + ex.Message);
            }
        }
    }
}
