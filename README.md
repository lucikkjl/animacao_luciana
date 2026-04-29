# Galeria Animada

Este projeto é a entrega da **Atividade Prática — Aula 9** da disciplina de Desenvolvimento para Dispositivos Móveis (5ª Fase - Análise e Desenvolvimento de Sistemas da Faculdade Senac Joinville). 

O objetivo do aplicativo é demonstrar o domínio sobre diferentes tipos de animações no Flutter, criação de widgets customizados e a aplicação do Material Design 3 em uma interface fluida e interativa.

## Tecnologias e Requisitos Implementados

O projeto atende a 100% dos requisitos solicitados na atividade, incluindo o desafio bônus:

* **Animação Implícita (`AnimatedContainer` + `AnimatedOpacity`):** Na tela inicial, há um card interativo que anima sua altura e o arredondamento das bordas ao ser tocado. Simultaneamente, um texto e um ícone surpresa aparecem utilizando um efeito suave de *fade in*.
* **Animação Explícita (`AnimationController` + `Tween`):** Uma estrela pulsante no centro da tela principal foi criada utilizando `AnimationController`, `CurvedAnimation` e `AnimatedBuilder` para garantir uma reconstrução eficiente da tela. O `dispose()` foi devidamente implementado.
* **Hero Animation:** Navegação fluida entre a lista de produtos e a tela de detalhes. O avatar colorido do produto "voa" de uma tela para a outra conectando o contexto visual através de uma *tag* única.
* **Material Design:** O tema do aplicativo foi configurado com `useMaterial3: true`. A paleta de cores foi estilizada com tons personalizados de rosa, e componentes nativos do M3, como o `FilledButton`, foram utilizados na interface.
* **Widget Customizado Reutilizável:** Criação do `ItemGaleriaWidget`, um componente de lista componentizado que recebe parâmetros via construtor (como id, título e cor customizada) e é reutilizado dinamicamente usando um `ListView.builder`.
* **Bônus - CustomPainter:** Implementação da classe `FormaCustomizadaPainter` para desenhar uma forma geométrica (um triângulo) do zero utilizando os métodos `drawPath` do `Canvas` na tela de detalhes.

## Estrutura do Projeto

O código foi organizado seguindo um padrão profissional de separação de responsabilidades:

* `/models` - Estrutura de dados (`produto.dart`).
* `/routes` - Centralização das rotas nomeadas do app (`app_routes.dart`).
* `/screens` - Divisão das telas por módulos (`galeria` e `detalhes`).
* `/widgets` - Componentes visuais isolados e reutilizáveis.

## Como executar

1. Clone este repositório.
2. Certifique-se de ter o Flutter instalado e configurado na sua máquina.
3. Rode `flutter pub get` para baixar e instalar as dependências.
4. Execute `flutter run` para iniciar o aplicativo em um emulador ou dispositivo físico.