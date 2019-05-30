module ExampleLinkHeaders
  EXAMPLE_LINK_HEADERS = [
    [
      '<https://example.com>; rel=home',
      {
        target: 'https://example.com',
        target_uri: 'https://example.com/',
        relations: 'home',
        relation_types: %w[home],
        parameters: {
          rel: 'home'
        }
      }
    ],
    [
      '<https://example.com>; rel="home previous"',
      {
        target: 'https://example.com',
        target_uri: 'https://example.com/',
        relations: 'home previous',
        relation_types: %w[home previous],
        parameters: {
          rel: 'home previous'
        }
      }
    ],
    [
      '</>; rel=home',
      {
        target: '/',
        target_uri: 'https://example.com/',
        relations: 'home',
        relation_types: %w[home],
        parameters: {
          rel: 'home'
        }
      }
    ],
    [
      '</>; rel="home"',
      {
        target: '/',
        target_uri: 'https://example.com/',
        relations: 'home',
        relation_types: %w[home],
        parameters: {
          rel: 'home'
        }
      }
    ],
    [
      '<https://example.com>; rel=https://example.com/foo',
      {
        target: 'https://example.com',
        target_uri: 'https://example.com/',
        relations: 'https://example.com/foo',
        relation_types: %w[https://example.com/foo],
        parameters: {
          rel: 'https://example.com/foo'
        }
      }
    ],
    [
      '<https://example.com>; rel="https://example.com/foo next"',
      {
        target: 'https://example.com',
        target_uri: 'https://example.com/',
        relations: 'https://example.com/foo next',
        relation_types: %w[https://example.com/foo next],
        parameters: {
          rel: 'https://example.com/foo next'
        }
      }
    ],
    [
      '</>; rel=https://example.com/foo',
      {
        target: '/',
        target_uri: 'https://example.com/',
        relations: 'https://example.com/foo',
        relation_types: %w[https://example.com/foo],
        parameters: {
          rel: 'https://example.com/foo'
        }
      }
    ],
    [
      '</>; rel="https://example.com/foo next"',
      {
        target: '/',
        target_uri: 'https://example.com/',
        relations: 'https://example.com/foo next',
        relation_types: %w[https://example.com/foo next],
        parameters: {
          rel: 'https://example.com/foo next'
        }
      }
    ]
  ].freeze
end
