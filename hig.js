const axios = require("axios");

const getIp = async () => {
  const request = await axios.get("https://hindenburg.rfy.nz/logs");
  console.log(request.data["onboard-ip"].value);
};

getIp();
