class Applemailmcp < Formula
  desc "Local MCP server for Apple Mail with Contacts integration"
  homepage "https://github.com/Clarus-Moof/AppleMailMCP"
  url "https://github.com/Clarus-Moof/AppleMailMCP/releases/download/v1.0.7/AppleMailMCP-1.0.7.zip"
  sha256 "b80a3a26cee958427897247e43f23a56e8ebe63852a7f1de5691d9726f17a612"
  version "1.0.7"
  license "MIT"

  on_macos do
    depends_on :macos => :sonoma
  end

  def install
    bin.install "AppleMailMCP"
  end

  def caveats
    <<~EOS
      AppleMailMCP is a local MCP server for Apple Mail.

      Add to your MCP client config (e.g. ~/.lmstudio/mcp.json):

        {
          "mcpServers": {
            "apple-mail": {
              "command": "#{bin}/AppleMailMCP",
              "args": []
            }
          }
        }

      On first use, macOS will ask for permission to access Mail and Contacts.
    EOS
  end

  test do
    assert_predicate bin/"AppleMailMCP", :executable?
  end
end
