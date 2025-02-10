KeyTool Utility:

Manages a keystore (database) of cryptographic keys, X.509 certificate chains, and trusted certificates.


$ keytool -genkey -keyalg RSA -alias <key-alias> -keystore <key-name>.jks -validity <days> -keysize 2048

- Key Encryption Algorithm
- Key Store Types
- Key Size

-keyalg
    "DSA" (when using -genkeypair)
    "DES" (when using -genseckey)
 
-keysize
    2048 (when using -genkeypair and -keyalg is "RSA")
    1024 (when using -genkeypair and -keyalg is "DSA")
    256 (when using -genkeypair and -keyalg is "EC")
    56 (when using -genseckey and -keyalg is "DES")
    168 (when using -genseckey and -keyalg is "DESede")


$ keytool -genseckey -alias 128bitkey -keyalg aes -keysize 128 -keystore keystore.jceks -storetype jceks
$ keytool -genseckey -alias 256bitkey -keyalg aes -keysize 256 -keystore keystore.jceks -storetype jceks


More information: [Oracle Offical Document](https://docs.oracle.com/javase/8/docs/technotes/tools/unix/keytool.html)
