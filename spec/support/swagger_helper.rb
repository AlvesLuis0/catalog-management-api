require 'rspec/openapi'

RSpec::OpenAPI.path = 'swagger/v1/swagger.yaml'

RSpec::OpenAPI.security_schemes = {
  'BearerToken' => {
    description: 'Authenticate API requests via a JWT',
    type: 'http',
    scheme: 'bearer',
    bearerFormat: 'JWT'
  }
}

# Change `info.version`
RSpec::OpenAPI.application_version = '1.0.0'

# Change the default title of the generated schema
RSpec::OpenAPI.title = 'Catalog Management API Documentation'
