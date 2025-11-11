using Bogus;
using Microsoft.Extensions.FileSystemGlobbing.Internal;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ClassLibrary.Shared.TestDataGenerator
{
    public class GenerateTestData
    {
        public static string RandomString(int length, Pattern pattern)
        {
            switch (pattern)
            {
                case Pattern.Alphabets:
                    return RandomAlpha(length);
                    break;
                case Pattern.AlphaNumerics:
                    return RandomAlphaNumeric(length);
                    break;
                case Pattern.AlphaNumericWithSpecialCharacters:
                    return RandomAlphaNumericWithSpecialCharachter(length);
                    break;
                case Pattern.Numerics:
                    return RandomNumeric(length);
                    break;
                case Pattern.SpecialCharacters:
                    return RandomSpecialCharachter(length);
                    break;
                case Pattern.Phone:
                    return RandomPhoneNumber(length);
                    break;
                case Pattern.Email:
                    return RandomEmail(length);
                    break;
                default:
                    throw new ArgumentOutOfRangeException($"The pattern {pattern} is not supported. Check the spelling or if the pattern is supported");
                    break;
            }
        }
        public static string RandomAlpha(int length)
        {
            var faker = new Faker();
            return faker.Random.String2(length, chars: "ABCDEFGHIJKLMNOPQRSTUVWXYXabcdefghijklmnopqrstuvwxyz");
        }
        public static string RandomAlphaNumeric(int length)
        {
            var faker = new Faker();
            return faker.Random.AlphaNumeric(length);
        }
        public static string RandomAlphaNumericWithSpecialCharachter(int length)
        {
            var faker = new Faker();
            return faker.Random.String2(length, chars: @"ABCDEFGHIJKLMNOPQRSTUVWXYXabcdefghijklmnopqrstuvwxyz0123456789~`!@#$%^&*()_-+={}[]|\:;'<>,.?");
        }

        public static string RandomSpecialCharachter(int length)
        {
            var faker = new Faker();
            return faker.Random.String2(length, chars: @"~`!@#$%^&*()_-+={}[]|\:;'<>,.?");
        }
        public static string RandomNumeric(int length)
        {
            var faker = new Faker();
            return faker.Random.String2(length, chars: "123456789");
        }

        public static string RandomPhoneNumber(int length)
        {
            var faker = new Faker();
            return faker.Person.Phone;
        }

        public static string RandomEmail(int length)
        {
            var faker = new Faker();
            return faker.Person.Email;
        }

    }
}

