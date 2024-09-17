// BANCO DE DADOS FAKE
const imoveisData = [
  {
    "id": 1,
    "image": "assets/images/imovel1.jpg",
    "valor": "380.000,00",
    "endereco": "Av. Major Nicácio, 123, Franca-SP",
    "tipo": "Sobrado",
    "quartos": "6",
    "banheiros": "4",
    "area": "390m²",
    "descricao":
        "Sobrado grande localizado no centro da cidade, com área de lazer e piscina, garagem para 2 carros, cozinha reformada. Possui painéis solares para aquecer a piscina e a água dos chuveiros. Há também um escritório nos fundos.",
    "descricao_quartos":
        "Quartos grandes com banheiros simples e guarda-roupas embutido",
    "descricao_banheiros":
        "Banheiro da suíte grande com banheira e agua aquecida, o banheiro do outro quarto é grande e tambem tem água aquecida",
    "garagem": "4",
  },
  {
    "id": 2,
    "image": "assets/images/imovel2.jpg",
    "valor": "250.000,00",
    "endereco": "Rua do Comércio, 456, Franca-SP",
    "tipo": "Casa popular",
    "quartos": "2",
    "banheiros": "2",
    "area": "200m²",
    "descricao":
        "Sobrado grande localizado no centro da cidade, com área de lazer e piscina, garagem para 2 carros, cozinha reformada",
    "descricao_quartos":
        "Quartos grandes com banheiros e guarda-roupas embutido",
    "descricao_banheiros":
        "Banheiro da suíte grande com banheira e agua aquecida, o banheiro do outro quarto é grande e tambem tem água aquecida",
    "garagem": "1",
  },
  {
    "id": 3,
    "image": "assets/images/imovel3.jpg",
    "valor": "1.250.000,00",
    "endereco": "Av. Rio Negro, 7890, Franca-SP",
    "tipo": "Mansão",
    "quartos": "8",
    "banheiros": "6",
    "area": "850m²",
    "descricao":
        "Sobrado grande localizado no centro da cidade, com área de lazer e piscina, garagem para 2 carros, cozinha reformada",
    "descricao_quartos":
        "Quartos grandes com banheiros e guarda-roupas embutido",
    "descricao_banheiros":
        "Banheiro da suíte grande com banheira e agua aquecida, o banheiro do outro quarto é grande e tambem tem água aquecida",
    "garagem": "4",
  },
  {
    "id": 4,
    "image": "assets/images/imovel4.jpg",
    "valor": "650.000,00",
    "endereco": "Av. Dois, 6190, Franca-SP",
    "tipo": "Sobrado Médio",
    "quartos": "7",
    "banheiros": "5",
    "area": "600m²",
    "descricao":
        "Sobrado grande localizado no centro da cidade, com área de lazer e piscina, garagem para 2 carros, cozinha reformada",
    "descricao_quartos":
        "Quartos grandes com banheiros e guarda-roupas embutido",
    "descricao_banheiros":
        "Banheiro da suíte grande com banheira e agua aquecida, o banheiro do outro quarto é grande e tambem tem água aquecida",
    "garagem": "5",
  },
  {
    "id": 5,
    "image": "assets/images/imovel5.jpg",
    "valor": "1.250.000,00",
    "endereco": "Rua das Mangueiras, 510, Franca-SP",
    "tipo": "Casa em Condomínio",
    "quartos": "7",
    "banheiros": "5",
    "area": "600m²",
    "descricao":
        "Sobrado grande localizado no centro da cidade, com área de lazer e piscina, garagem para 2 carros, cozinha reformada",
    "descricao_quartos":
        "Quartos grandes com banheiros e guarda-roupas embutido",
    "descricao_banheiros":
        "Banheiro da suíte grande com banheira e agua aquecida, o banheiro do outro quarto é grande e tambem tem água aquecida",
    "garagem": "5",
  },
  {
    "id": 6,
    "image": "assets/images/imovel6.jpg",
    "valor": "1.500.000,00",
    "endereco": "Rua das Magnólias, 200, Franca-SP",
    "tipo": "Mansão em Condomínio",
    "quartos": "7",
    "banheiros": "5",
    "area": "600m²",
    "descricao":
        "Sobrado grande localizado no centro da cidade, com área de lazer e piscina, garagem para 2 carros, cozinha reformada",
    "descricao_quartos":
        "Quartos grandes com banheiros e guarda-roupas embutido",
    "descricao_banheiros":
        "Banheiro da suíte grande com banheira e agua aquecida, o banheiro do outro quarto é grande e tambem tem água aquecida",
    "garagem": "5",
  },
  {
    "id": 7,
    "image": "assets/images/imovel7.jpg",
    "valor": "550.000.000,00",
    "endereco": "Av. Rio Negro, 110, Franca-SP",
    "tipo": "Apartamento",
    "quartos": "7",
    "banheiros": "5",
    "area": "600m²",
    "descricao":
        "Sobrado grande localizado no centro da cidade, com área de lazer e piscina, garagem para 2 carros, cozinha reformada",
    "descricao_quartos":
        "Quartos grandes com banheiros e guarda-roupas embutido",
    "descricao_banheiros":
        "Banheiro da suíte grande com banheira e agua aquecida, o banheiro do outro quarto é grande e tambem tem água aquecida",
    "garagem": "5",
  },
  {
    "id": 8,
    "image": "assets/images/imovel8.jpg",
    "valor": "950.000,00",
    "endereco": "Av. São Vicente, 4350, Franca-SP",
    "tipo": "Apartamento",
    "quartos": "7",
    "banheiros": "5",
    "area": "600m²",
    "descricao":
        "Sobrado grande localizado no centro da cidade, com área de lazer e piscina, garagem para 2 carros, cozinha reformada",
    "descricao_quartos":
        "Quartos grandes com banheiros e guarda-roupas embutido",
    "descricao_banheiros":
        "Banheiro da suíte grande com banheira e agua aquecida, o banheiro do outro quarto é grande e tambem tem água aquecida",
    "garagem": "5",
  },
  {
    "id": 9,
    "image": "assets/images/imovel9.jpg",
    "valor": "1.300.000,00",
    "endereco": "Av. Rio Negro, 7890, Franca-SP",
    "tipo": "Apartamento",
    "quartos": "7",
    "banheiros": "5",
    "area": "600m²",
    "descricao":
        "Sobrado grande localizado no centro da cidade, com área de lazer e piscina, garagem para 2 carros, cozinha reformada",
    "descricao_quartos":
        "Quartos grandes com banheiros e guarda-roupas embutido",
    "descricao_banheiros":
        "Banheiro da suíte grande com banheira e agua aquecida, o banheiro do outro quarto é grande e tambem tem água aquecida",
    "garagem": "5",
  },
];
