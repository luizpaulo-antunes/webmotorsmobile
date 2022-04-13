Dado('que eu quero procurar um carro no aplicativo webmotors') do
  @carro = ListaCarro.new
  @carro.topo
  @carro.valor
  @carro.model
  @carro.ano
end

Então('a lista dos carros é exibida e suas informações') do
  @carro.selecao
end