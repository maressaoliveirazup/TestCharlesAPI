#@OMDB_apikey_valid
Dado("que eu informe os dados Titulo {string}, Tipo {string}, Ano {string}, Retorno {string}, Pagina {string}, callbacck {string} e Versao {string}") do |s, type, y, r, page, callback, v|
  $s = s
  $r = r
  $callback = callback
  @query_params = $OMDB.generate_query_params_valid($s, type, y, $r, page, $callback, v)
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
  query_params = $OMDB.generate_query_params_invalid
  @response = $OMDB.get_titles(query_params)
end

Entao("a minha requisicao deve falhar e retornar {int}") do |code|
  expect(@response.code).to eq(code)
  @response_body = JSON.parse(@response.body)
  puts "\n\nO retorno da requisicao foi: \n#{JSON.pretty_generate(@response_body)}"
end

Entao("deve retornar a mensagem {string}") do |message|
  expect(@response_body['Error']).to eq(message)
end

#@OMDB_all_empty
Quando("eu realizar a busca de um titulo somente com o apikey preenchido") do
  query_params = $OMDB.generate_query_params_empty()
  @response = $OMDB.get_titles(query_params)
end

Entao("a minha requisicao deve retornar a mensagem {string}") do |message|
  @response_body = JSON.parse(@response.body)
  puts "\n\nO retorno da requisicao foi: \n#{JSON.pretty_generate(@response_body)}"
  expect(@response_body['Error']).to eq(message)
end

