# #Configuration options 
# Lists all configuration options for the pimatic framework itself.
# For an example `config.json` file see the `config_default.json` file.

# Defines a `node-convict` config-schema and exports it.
module.exports =
  settings:
    locale:
      doc: "The default language"
      format: ['en', 'de', "es", "nl"]
      default: "en"
    debug:
      doc: "Turn on debug checks. Set the logLevel to debug to additional outputs"
      format: Boolean
      default: false
    authentication:
      username:
        doc: "The Username for http-basic-authentication"
        format: String
        default: ""
      password:
        doc: "The Password for http-basic-authentication"
        format: String
        default: ""
      enabled:
        doc: "Disable http-basic-authentication"
        format: Boolean
        default: true
      loginTime:
        doc: """The time in milliseconds to keep the session cookie if rememberMe is checked. 
        If 0 then delete the cookie on browser close.
        """
        format: Number
        default: 30 * 24 * 60 * 60 * 1000 #thirty days
    logLevel:
      doc: "The log level: debug, info, warn, error" 
      format: String
      default: "info"
    httpServer:
      enabled: 
        doc: "Should the http-server be started"
        format: Boolean
        default: true
      port:
        doc: "The port of the http-server"
        format: "port"
        default: 80
      hostname:
        doc: "The hostname of the http-server"
        format: String
        default: "" # If is empty then listen to all ip4Adresses
    httpsServer:
      enabled: 
        doc: "Should the https-server be started"
        format: Boolean
        default: false
      port:
        doc: "The port of the https-server"
        format: "port"
        default: 443
      hostname:
        doc: "The hostname of the https-server"
        format: String
        default: "" # If is empty then listen to all ip4Adresses
      ###
      Download and run https://raw.githubusercontent.com/pimatic/pimatic/master/install/ssl-setup
      and un ssl-setup in you pimatic-app dir to generate the necessary key and certificate files:
      
          wget https://raw.githubusercontent.com/pimatic/pimatic/master/install/ssl-setup
          chmod +x ssl-setup
          ./ssl-setup

      ###
      keyFile:
        doc: "Privatekey file"
        format: String
        default: "ca/pimatic-ssl/private/privkey.pem"
      certFile:
        doc: "Public certification file in pem-format"
        format: String
        default: "ca/pimatic-ssl/public/cert.pem"
      rootCertFile:
        doc: """The public root certificate file of your own CA if you using a self signed 
        certificate. This option is optional. Its just for the frontent, so that it can provide a 
        link to the the root certificate for easy importing in mobile devices."""
        format: String
        default: "ca/certs/cacert.crt"
    database:
      client: 
        doc: "the databse client to use"
        format: ["sqlite3", "mysql", "pg"]
        default: "sqlite3"
      ###
      The connection setting is database client dependent. Some examples:
      __sqlite3:__

          {
            filename: "pimatic-database.sqlite"
          }

      __mysql:__

          {
            host     : '127.0.0.1',
            user     : 'your_database_user',
            password : 'your_database_password',
            database : 'myapp_test'
          }
      ###
      connection:
        doc: "the connection settings for the database client"
        format: Object
        default: {
          filename: "pimatic-database.sqlite"
        }
      deviceAttributeLogging:
        doc: "time to keep logged device attributes values in database"
        format: Array
        default: []
      messageLogging:
        doc: "time to keep logged messages in database"
        format: Array
        default: []
  plugins:
    doc: "Array of plugins to load"
    format: Array
    default: []
  devices:
    doc: "Array of device definations"
    format: Array
    default: []
  rules:
    doc: "Array of rules"
    format: Array
    default: []
  variables:
    doc: "Array of variables"
    format: Array
    default: []
