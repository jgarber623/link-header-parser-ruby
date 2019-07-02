module ExampleLinkHeaders
  EXAMPLE_LINK_HEADERS_WITH_ANCHORS = [
    [
      '<https://example.com>; anchor=#foo',
      {
        context: '#foo',
        context_uri: 'https://example.com/#foo',
        parameters: {
          anchor: '#foo'
        }
      }
    ],
    [
      '<https://example.com>; anchor="#foo"',
      {
        context: '#foo',
        context_uri: 'https://example.com/#foo',
        parameters: {
          anchor: '#foo'
        }
      }
    ],
    [
      '</>; anchor=#foo',
      {
        context: '#foo',
        context_uri: 'https://example.com/#foo',
        parameters: {
          anchor: '#foo'
        }
      }
    ],
    [
      '</>; anchor="#foo"',
      {
        context: '#foo',
        context_uri: 'https://example.com/#foo',
        parameters: {
          anchor: '#foo'
        }
      }
    ],
    [
      '<https://example.com/foo>; anchor=bar',
      {
        context: 'bar',
        context_uri: 'https://example.com/bar',
        parameters: {
          anchor: 'bar'
        }
      }
    ],
    [
      '<https://example.com/foo>; anchor="bar"',
      {
        context: 'bar',
        context_uri: 'https://example.com/bar',
        parameters: {
          anchor: 'bar'
        }
      }
    ],
    [
      '<https://example.com/foo>; anchor=../bar',
      {
        context: '../bar',
        context_uri: 'https://example.com/bar',
        parameters: {
          anchor: '../bar'
        }
      }
    ],
    [
      '<https://example.com/foo>; anchor="../bar"',
      {
        context: '../bar',
        context_uri: 'https://example.com/bar',
        parameters: {
          anchor: '../bar'
        }
      }
    ],
    [
      '</>; anchor=bar',
      {
        context: 'bar',
        context_uri: 'https://example.com/bar',
        parameters: {
          anchor: 'bar'
        }
      }
    ],
    [
      '</>; anchor="bar"',
      {
        context: 'bar',
        context_uri: 'https://example.com/bar',
        parameters: {
          anchor: 'bar'
        }
      }
    ],
    [
      '</>; anchor=../bar',
      {
        context: '../bar',
        context_uri: 'https://example.com/bar',
        parameters: {
          anchor: '../bar'
        }
      }
    ],
    [
      '</>; anchor="../bar"',
      {
        context: '../bar',
        context_uri: 'https://example.com/bar',
        parameters: {
          anchor: '../bar'
        }
      }
    ],
    [
      '<https://example.com>; rel=home; anchor="#foo"',
      {
        context: '#foo',
        context_uri: 'https://example.com/#foo',
        parameters: {
          anchor: '#foo',
          rel: 'home'
        }
      }
    ],
    [
      '<https://example.com>; rel="home previous"; anchor=#foo',
      {
        context: '#foo',
        context_uri: 'https://example.com/#foo',
        parameters: {
          anchor: '#foo',
          rel: 'home previous'
        }
      }
    ],
    [
      '</foo>; rel=home; anchor="#bar"',
      {
        context: '#bar',
        context_uri: 'https://example.com/foo#bar',
        parameters: {
          anchor: '#bar',
          rel: 'home'
        }
      }
    ],
    [
      '</foo>; rel="home previous"; anchor=#bar',
      {
        context: '#bar',
        context_uri: 'https://example.com/foo#bar',
        parameters: {
          anchor: '#bar',
          rel: 'home previous'
        }
      }
    ],
    [
      '</>; anchor="https://context.example.com"',
      {
        context: 'https://context.example.com',
        context_uri: 'https://context.example.com/',
        parameters: {
          anchor: 'https://context.example.com'
        }
      }
    ]
  ].freeze
end
