using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Text;

namespace QueryTicketSystem.Classes
{
    public static class EncryptDecrypt
    {
        public static string Encrypt(this string DecryptedValue)
        {
           return  HttpServerUtility.UrlTokenEncode(MachineKey.Protect(Encoding.UTF8.GetBytes(DecryptedValue.Trim())));
        }

        // This will return an unencrypted string based on the parameter
        public static string Decrypt(this string EncryptedValue)
        {
            return Encoding.UTF8.GetString(MachineKey.Unprotect(HttpServerUtility.UrlTokenDecode(EncryptedValue)));
        }
    }
}