using System;
using System.Security.Cryptography;
using System.Text;

public class PKCEHelper
{
    public static (string codeVerifier, string codeChallenge) GeneratePKCE()
    {
        var codeVerifier = GenerateRandomString(128); 

        //SHA256 will be returned
        var codeChallenge = GenerateCodeChallenge(codeVerifier);

        return (codeVerifier, codeChallenge);
    }


    private static string GenerateRandomString(int length)
    {
        const string validChars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789-._~";
        var randomBytes = new byte[length];
        using (var rng = RandomNumberGenerator.Create())
        {
            rng.GetBytes(randomBytes);
        }
        var stringBuilder = new StringBuilder(length);
        foreach (var b in randomBytes)
        {
            stringBuilder.Append(validChars[b % validChars.Length]);
        }
        return stringBuilder.ToString();
    }

    private static string GenerateCodeChallenge(string codeVerifier)
    {
        var codeVerifierBytes = Encoding.ASCII.GetBytes(codeVerifier);
        using (var sha256 = SHA256.Create())
        {
            var hash = sha256.ComputeHash(codeVerifierBytes);
            return Base64UrlEncode(hash);
        }
    }

    private static string Base64UrlEncode(byte[] input)
    {
        string base64 = Convert.ToBase64String(input);
        base64 = base64.Split('=')[0]; // Remove padding
        base64 = base64.Replace('+', '-'); // URL safe
        base64 = base64.Replace('/', '_'); // URL safe
        return base64;
    }
}
