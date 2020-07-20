#@OMDB_apikey_valid
Dado("que eu informe os dados Titulo {string}, Tipo {string}, Ano {string}, Retorno {string}, Pagina {string}, callbacck {string} e Versao {string}") do |s, type, y, r, page, callback, v|
  $s = s
  $type = type
  $y = y
  $r = r
  $page = page
  $callback = callback
  $v = v
  @query_params = $OMDB.generate_query_params_valid($s, $type, $y, $r, $page, $callback, $v)
end

Quando("eu realizar a busca") do
  @response = $OMDB.get_titles(@query_params)
end

Entao("a minha requisicao deve ter o retorno {int}") do |code|
  expect(@response.code).to eq(code)
end

Entao("os titulos referente a busca devem ser retornados com sucesso") do

  if($r == "xml")
    @payload = Nokogiri.XML(@response)
    puts "\n\nO retorno da requisicao foi: \n#{@payload}"
  else
    if($callback != "")
      @body = @response.to_s
      puts "\n\nO retorno da requisicao foi: \n#{@body}"
    else
      @payload = JSON.parse(@response.body)
      puts "\n\nO retorno da requisicao foi: \n#{JSON.pretty_generate(@payload)}"
    end
  end

end


#@OMDB_apikey_invalid
Quando("eu realizar a busca de um titulo com um apikey invalido") do
  @query_params = $OMDB.generate_query_params_invalid
  @response = $OMDB.get_titles(@query_params)
end

Entao("a minha requisicao deve falhar e retornar {int}") do |code|
  expect(@response.code).to eq(code)
  @payload = JSON.parse(@response.body)
  puts "\n\nO retorno da requisicao foi: \n#{JSON.pretty_generate(@payload)}"
end

