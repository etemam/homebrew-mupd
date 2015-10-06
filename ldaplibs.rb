# Documentation: https://github.com/Homebrew/homebrew/blob/master/share/doc/homebrew/Formula-Cookbook.md
#                http://www.rubydoc.info/github/Homebrew/homebrew/master/frames
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!

class Libldap < Formula
  desc "Ldap libs from openldap"
  homepage "http://www.openldap.org/"
  url "ftp://ftp.openldap.org/pub/OpenLDAP/openldap-release/openldap-2.4.42.tgz"
  version "2.4.42"
  sha256 "eeb7b0e2c5852bfd2650e83909bb6152835c0b862fab10b63954dc1bcbba8e63"

  def install
    # ENV.deparallelize  # if your formula fails when building in parallel

    # Remove unrecognized options if warned by configure
    system "./configure", "--disable-debug",
                          "--disable-slapd",
                          "--enable-shared",
                          "--prefix=#{prefix}"
    # system "cmake", ".", *std_cmake_args
    #system "make", "install" # if this fails, try separate make/make install steps
  end

end
