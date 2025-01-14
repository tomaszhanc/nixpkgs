{ lib
, aenum
, aiodns
, aiohttp
, buildPythonPackage
, cchardet
, fetchFromGitHub
, pyopenssl
, pythonOlder
, pytz
, related
, requests
, uonet-request-signer-hebe
, yarl
}:

buildPythonPackage rec {
  pname = "vulcan-api";
  version = "2.2.0";
  format = "setuptools";

  disabled = pythonOlder "3.6";

  src = fetchFromGitHub {
    owner = "kapi2289";
    repo = pname;
    rev = "refs/tags/v${version}";
    sha256 = "sha256-decp3wq/O4QTBE40iSkMaCTJYM6XPP7nLlSAEL1bemY=";
  };

  propagatedBuildInputs = [
    aenum
    aiodns
    aiohttp
    cchardet
    pyopenssl
    pytz
    related
    requests
    uonet-request-signer-hebe
    yarl
  ];

  # Project has no tests
  doCheck = false;

  pythonImportsCheck = [
    "vulcan"
  ];

  meta = with lib; {
    description = "Python library for UONET+ e-register API";
    homepage = "https://vulcan-api.readthedocs.io/";
    license = licenses.mit;
    maintainers = with maintainers; [ fab ];
  };
}
