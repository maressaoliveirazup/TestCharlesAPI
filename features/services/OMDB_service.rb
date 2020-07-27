class ServiceOMDB
  include HTTParty
  base_uri CONFIG['base_uri']
  #format :json
  headers "Content-Type" => "application/json"

  def generate_query_params_valid(s, type, y, r, page, callback, v)
     @params = {
                "s" => "#{s}",
                "type" => "#{type}",
                "y" => "#{y}",
                "r" => "#{r}",
                "page" => "#{page}",
                "callback" => "#{callback}",
                "v" => "#{v}",
                "apikey" => "52ec71bf"
              }
  end

  def generate_query_params_invalid
    @params = {
              "apikey" => "123"
              }
  end

  def generate_query_params_empty
    @params = {
              "s" => "",
              "type" => "",
              "y" => "",
              "r" => "",
              "page" => "",
              "callback" => "",
              "v" => "",
              "apikey" => "52ec71bf"
            }
  end

  def get_titles(query_params)
    if($r == "xml")
      self.class.get('', :format => "xml", :query => query_params)
    elsif($r == "")
      self.class.get('', :query => query_params)
    else
      self.class.get('', :format => "json", :query => query_params)
    end
  end

end