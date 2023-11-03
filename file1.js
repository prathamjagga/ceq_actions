// import fetch from "node-fetch";
async function fetchData() {
	const url = "https://api.newrelic.com/graphql";
	const query = {
		query: `{
          actor {
            account(id: 4042825) {
              q1: nrql(query: "select * from SystemSample") {
                results,
                nrql
              }
              q2: nrql(query: "select * from Metric") {
                results,
                nrql
              }
            }
          }
        }`,
		variables: "",
	};

	try {
		const response = await fetch(url, {
			method: "POST",
			headers: {
				"Content-Type": "application/json",
				"Api-Key": "NRAK-Q109PP4C0FOCEH1IZ5UZ8LGFH4B",
			},
			body: JSON.stringify(query),
		});

		if (!response.ok) {
			throw new Error(`HTTP error! Status: ${response.status}`);
		}

		const data = await response.json();
		const q1Results = data.data.actor.account.q1.results;
		const q2Results = data.data.actor.account.q2.results;

		console.log("q1 results:", q1Results);
		console.log("q2 results:", q2Results);
	} catch (error) {
		console.log("Error:", error);
	}
}

fetchData();
