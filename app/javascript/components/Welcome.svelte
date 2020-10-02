<script>

import { createEventDispatcher } from 'svelte';

export let user;

let dispatch = createEventDispatcher();

</script>

<main>

{#if user !== null}
  <h1>Welcome {user.first_name}!</h1>
  {#if user.caterer == true}
    <h2>You will soon be able to create your store</h2>
    {:else}
    <h2>You will soon be able to order</h2>
  {/if}
{:else}
  <h1>Please log in to continue!</h1>
{/if}

</main>

<style>

main {
  width: 100vw;
  height: 100%;
  min-height: 100vh;
  background-image: url('/images/HomePageSplash.jpg');
  background-position: top left;
  margin: 0;
  display: grid;
  background-size: cover;
  background-repeat: no-repeat;
  color: #fdfdfd;
  border-bottom-left-radius: 40%;
  border-bottom-right-radius: 40%;
  align-content: center;
  justify-items: center;
  }

  h1 {
    color: #000000;
    padding: 20px;
    border-radius: 5px;
    background-color: rgba(235,235,235,0.7);
    box-shadow: 0 0 1px -3px rgba(255,255,255,0.9)
  }

</style>