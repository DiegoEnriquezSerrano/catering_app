<script>

import { onMount } from 'svelte';

onMount(() => {
  let url = "/caterers";
  let reqParams = {
    method: 'GET',
    headers: { "Content-Type": "application/json" }
  };
  fetch(url, reqParams)
  .then(response => {
    if (response.status == 201) {
      console.log(response);
    }
    else return response;
    })
})

</script>