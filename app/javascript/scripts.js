export let getLocation = () => {
  let currentLocation = window.location.pathname.split('/').splice(1);
  console.log(currentLocation)
  return currentLocation;
}

export let processAjaxData = (response, urlPath) => {
  window.history.pushState({
    "html": response,
    "pageTitle": response.pageTitle
  },
  "",
  urlPath
  );
};

export async function sectionClick(e) {
  let obj;
  await fetch(e.target.pathname, { method: 'GET', headers: { "Content-Type": "application/json" } })
    .then(response => {
      response = { status: response.status, response: response }
      return response;
    })
    .then(async data => {
      let res = await data.response.text();
      if (data.status == 200) {
        obj = { page: e.target.pathname.split('/')[1], params: e.target.pathname.split('/').slice(2).join('/') }
        processAjaxData(res, data.response.url);
      }
    })
    return obj;
};
