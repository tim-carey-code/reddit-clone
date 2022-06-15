import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["subreddit", "subscriber"];

  subscribe() {
    const data = {
      subreddit: this.subredditTarget.value,
      subscriber: this.subscriberTarget.value,
    };
    fetch("http://localhost:3000/subscribers", {
      method: "POST", // or 'PUT'
      headers: {
        "Content-Type": "application/json",
      },
      credentials: "same-origin",
      body: JSON.stringify(parseInt(data)),
    })
      .then((response) => {
        console.log("Response: ", response.json());
        response.json();
      })
      .then((data) => {
        console.log("Success:", data);
      })
      .catch((error) => {
        console.error("Error:", error);
      });
  }
}
