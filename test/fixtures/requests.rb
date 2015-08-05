def stub_requests
  stub_request(:post, 'https://login.eveonline.com/oauth/token').
    to_return(headers: { 'Content-Type' => 'application/json' },
              body: {
                access_token: 'uNEEh...a_WpiaA2',
                token_type: 'Bearer',
                expires_in: 300,
                refresh_token: nil
              }.to_json)

  stub_request(:get, "https://login.eveonline.com/oauth/verify").
    to_return(headers: { 'Content-Type' => 'application/json' },
              body: {
                CharacterID: 273042051,
                CharacterName: 'CCP illurkall',
                ExpiresOn: '2014-05-23T15:01:15.182864Z',
                Scopes: ' ',
                TokenType: 'Character',
                CharacterOwnerHash: 'XM4D...FoY=',
              }.to_json)
end
