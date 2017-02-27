require 'formula'

class Marisa < Formula
  homepage 'https://code.google.com/p/marisa-trie/'
  url 'https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/marisa-trie/marisa-0.2.4.tar.gz'
  sha256 '67a7a4f70d3cc7b0a85eb08f10bc3eaf6763419f0c031f278c1f919121729fb3'

  def install
    system "./configure", "--disable-debug",
                          "--disable-dependency-tracking",
                          "--disable-silent-rules",
                          "--prefix=#{prefix}"

    system "make", "install"
  end
end
