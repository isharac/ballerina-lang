import ballerina.net.http;
import ballerina.lang.system;
import ballerina.utils.logger;

function main (string[] args) {
    http:ClientConnector clientConnector = create
                                http:ClientConnector("https://localhost:9095", getConnectorConfigs());
    http:Request req = {};
    logger:info("Sending request");
    http:Response resp = clientConnector.get("/echo/", req);
    logger:info("response received");
    system:println(resp.getStringPayload());
}

function getConnectorConfigs() (http:Options) {
    http:Options option = {
              ssl: {
               keyStoreFile:"${ballerina.home}/bre/security/wso2carbon.jks",
               keyStorePassword:"wso2carbon",
               trustStoreFile:"${ballerina.home}/bre/security/client-truststore.jks",
               trustStorePassword:"wso2carbon",
               ciphers:"TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA",
               sslEnabledProtocols:"TLSv1.2,TLSv1.1"
                   },
              followRedirects: {}
    };
    return option;
}