require File.expand_path(File.dirname(__FILE__) + '/../test_helper.rb')

class OpenStack::Connection
  attr_reader :method, :service_host, :url, :service_port, :service_scheme, :headers, :data
  def csreq(method,service_host,url,service_port,service_scheme,headers = {},data = nil,attempts = 0, &block)
    if method == "POST"
      @method         = method
      @service_host   = service_host
      @url            = url
      @service_port   = service_port
      @service_scheme = service_scheme
      @headers        = headers
      @data           = data
    end
    DummyNetHTTPResponse.new
  end
end

class DummyNetHTTPResponse
  def [](key)
    headers = {"X-Fis-Cluster" => 'test'}
    headers[key]
  end
  def code
    "200"
  end
  def body
    json_response = %{{
      "server" :
        {
          "id" : 1234,
          "name" : "sample-server",
          "image" : { "id": "2" },
          "flavor" : { "id" : "1" },
          "hostId" : "e4d909c290d0fb1ca068ffaddf22cbd0",
          "status" : "BUILD",
          "progress" : 60,
          "addresses" : {
              "public" : [
                  { "version" : 4, "addr" : "67.23.10.132" },
                  { "version" : 4, "addr" : "67.23.10.131" }
              ],
              "private" : [
                  { "version" : 4, "addr" : "10.176.42.16" }
              ]
          },
          "metadata" : {
              "Server Label" : "Web Head 1",
              "Image Version" : "2.1"
          }
        }
    }}
  end
end


class ComputeConnectionTest < Test::Unit::TestCase
  include TestConnection

  def setup
    @comp=get_test_connection
  end

  def test_list_servers
    server=@comp.create_server(fis_cluster: "test", name: 'test_name', flavorRef: 'flavorRef')
    assert_equal 'test', @comp.connection.headers["X-Fis-Cluster"]
  end
end

