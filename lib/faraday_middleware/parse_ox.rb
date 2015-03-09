require 'faraday_middleware/parse_ox/version'
require 'faraday_middleware/response_middleware'
require 'faraday_middleware/parse_ox/parser'

Faraday::Response.register_middleware ox: FaradayMiddleware::ParseOx::Parser