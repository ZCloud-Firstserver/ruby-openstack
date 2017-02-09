require File.expand_path(File.dirname(__FILE__) + '/../test_helper.rb')


class ComputeConnectionTest < Test::Unit::TestCase
  include TestConnection

  def setup
    @comp=get_test_connection
  end

  def test_list_servers

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
    response = mock()
    response.stubs(:code => "200", :body => json_response, :[] => 'mitaka')
    @comp.connection.stubs(:csreq).returns(response)
    server=@comp.get_server(1234)
    assert_equal 'mitaka', server.fis_cluster
  end
end
