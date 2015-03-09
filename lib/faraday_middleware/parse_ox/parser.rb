module FaradayMiddleware
  module ParseOx
    class Parser < ResponseMiddleware
      dependency 'ox'

      define_parser do |body|
        matches = body.match(/encoding="(.*?)"/)
        encoding = matches ? matches[1] : 'utf-8'
        unless body.strip.empty?
          Ox.load(body, skip: :skip_white, mode: :generic, symbolize_keys: true, encoding: encoding)
        end
      end
    end
  end
end