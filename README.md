# Ágora: app Android para estudar filosofia

São 20 filósofos (com Diógenes e Sísifo). Para cada um há ideias centrais, obras de referência e um chat em que o filósofo responde no próprio estilo, com base nas obras dele.

O app é feito com [Capacitor](https://capacitorjs.com). O conteúdo fica em `www/index.html`.

## Opção 1: gerar o APK pelo GitHub (sem instalar nada)

1. Crie um repositório no GitHub (pode ser privado).
2. Envie o conteúdo desta pasta para a branch `main`.
3. Abra a aba **Actions**. O workflow **Gerar APK** roda sozinho a cada push e leva uns 5 minutos.
4. Quando terminar, abra a execução e baixe o arquivo **agora-apk** na seção *Artifacts*. É um .zip com o `app-debug.apk` dentro.
5. Passe o APK para o celular e abra. O Android vai pedir para permitir a instalação de fontes desconhecidas.

Para rodar de novo sem push, use **Actions > Gerar APK > Run workflow**.

## Opção 2: Android Studio

Pré-requisitos: Node 20, JDK 17 e Android Studio.

```bash
npm install
npx cap add android
bash scripts/apply-icons.sh
npx cap sync android
npx cap open android
```

No Android Studio, use **Run** com o celular conectado ou **Build > Build APK(s)**.

## Chave da API

O chat usa a API da Anthropic. Na primeira conversa, o app pede a chave:

1. Crie uma chave em https://console.anthropic.com/settings/keys e adicione créditos.
2. No app, toque em ⚙ na tela inicial, cole a chave e escolha o modelo.

A chave fica salva só no aparelho. O uso é cobrado na sua conta da Anthropic. O Haiku é a opção mais barata.

Como a chave fica dentro do app, não distribua o APK com a sua chave já configurada. Para publicar na Play Store, o ideal é colocar um backend próprio entre o app e a API.

## Editar conteúdo

Os filósofos estão no array `P`, em `www/index.html`. Cada um tem bio, ideias, obras, estilo de fala, saudação e aparência do retrato. Depois de editar, faça push (opção 1) ou rode `npx cap sync android` (opção 2).
