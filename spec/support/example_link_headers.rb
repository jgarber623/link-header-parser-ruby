module ExampleLinkHeaders
  EXAMPLE_LINK_HEADERS = [
    [
      '<https://example.com>; rel=home',
      {
        target_string: 'https://example.com',
        target_uri: 'https://example.com/',
        relations_string: 'home',
        relation_types: %w[home],
        link_parameters: {
          rel: ['home']
        }
      }
    ],
    [
      '<https://example.com>; rel="home previous"',
      {
        target_string: 'https://example.com',
        target_uri: 'https://example.com/',
        relations_string: 'home previous',
        relation_types: %w[home previous],
        link_parameters: {
          rel: ['home previous']
        }
      }
    ],
    [
      '</>; rel=home',
      {
        target_string: '/',
        target_uri: 'https://example.com/',
        relations_string: 'home',
        relation_types: %w[home],
        link_parameters: {
          rel: ['home']
        }
      }
    ],
    [
      '</>; rel="home"',
      {
        target_string: '/',
        target_uri: 'https://example.com/',
        relations_string: 'home',
        relation_types: %w[home],
        link_parameters: {
          rel: ['home']
        }
      }
    ],
    [
      '<https://example.com>; rel=https://example.com/foo',
      {
        target_string: 'https://example.com',
        target_uri: 'https://example.com/',
        relations_string: 'https://example.com/foo',
        relation_types: %w[https://example.com/foo],
        link_parameters: {
          rel: ['https://example.com/foo']
        }
      }
    ],
    [
      '<https://example.com>; rel="https://example.com/foo next"',
      {
        target_string: 'https://example.com',
        target_uri: 'https://example.com/',
        relations_string: 'https://example.com/foo next',
        relation_types: %w[https://example.com/foo next],
        link_parameters: {
          rel: ['https://example.com/foo next']
        }
      }
    ],
    [
      '</>; rel=https://example.com/foo',
      {
        target_string: '/',
        target_uri: 'https://example.com/',
        relations_string: 'https://example.com/foo',
        relation_types: %w[https://example.com/foo],
        link_parameters: {
          rel: ['https://example.com/foo']
        }
      }
    ],
    [
      '</>; rel="https://example.com/foo next"',
      {
        target_string: '/',
        target_uri: 'https://example.com/',
        relations_string: 'https://example.com/foo next',
        relation_types: %w[https://example.com/foo next],
        link_parameters: {
          rel: ['https://example.com/foo next']
        }
      }
    ]
  ].freeze
end
