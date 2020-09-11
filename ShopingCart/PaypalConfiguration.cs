using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using PayPal.Api;

namespace ShopingCart
{
    public class PaypalConfiguration
    {
        public readonly static string clientId;

        public readonly static string clientSecret;


        static PaypalConfiguration()
        {
            var config = Getconfig();
            clientId = "ASrbZkKqMGmfhsGv1SoX8btE-gUVcCz6W0xFIP0plMKvxBXIaxz9z1N9soluISHXADBgOi79S5NMPmLs";
            clientSecret ="ED1E-VdePJ8IVAeh7mr-AlNIhopd_0o-9JGtgjmuQrBrPvjs29CBdp8aJFkAD8MyR_OcFj5a5PSYsDSw";

        }

        private static Dictionary<string,string> Getconfig()
        {
            return PayPal.Api.ConfigManager.Instance.GetProperties();
        }

        private static string GetAccessToken()
        {
            string accessToken = new OAuthTokenCredential(clientId, clientSecret, Getconfig()).GetAccessToken();
            return accessToken;
        }

        public static APIContext GetAPIContext()
        {
            APIContext apicontext = new APIContext(GetAccessToken());

            apicontext.Config =Getconfig();

            return apicontext;
        }
    }
}