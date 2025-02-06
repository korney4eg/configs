module.exports = {
  defaultBrowser: "Firefox",
  rewrite: [],
  handlers: [
    {
      match: ["https://github.com/korney4eg/configs/*"],
      browser: "Firefox",
    },
    {
      // Open google.com and *.google.com urls in Google Chrome
      match: [
        // Google Services
        "https://google.com/*", // match google.com urls
        "https://console.google.com/*", // match google.com urls
        "https://console.cloud.google.com*", // match google.com urls
        "https://meet.google.com/*", // match google.com urls
        "https://docs.google.com/*", // match google.com urls
        "https://calendar.google.com/*", // match google.com urls
        "https://mail.google.com/*", // match google.com urls
        "https://forms.gle/*", // match google.com urls
        // Okta
        "https://openx.okta.com/*", // okta
        "https://slack.com/*", // everything from slack goes to work browser
        "https://github.com/openx/*", // match google.com urls
        "https://github.com/search*", // match google.com urls
        "https://openxtechinc.atlassian.net/*",
        "https://id.atlassian.com/*",
        "https://app.terraform.io/app/openx/*",
        "https://google.qwiklabs.com/*",
        "https://openxtechinc1.app.opsgenie.com/*",
        "https://opsg.in/a/i/openxtechinc1/",
        "https://hrportalcee.vistra.com/*",
        "https://grafana.prod.gcp.openx.org/*",
        "https://desktop.pingone.com/openx/*",
        "https://*.gcp.openx.org/*",
        "https://account.jetbrains.com/*",
        "https://opsg.in/*",
	"https://openx.slack.com/*"
      ],
      browser: "Google Chrome",
    },
  ],
};
