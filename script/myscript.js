// category template

function catTemplate(item) {
    return `
    <div class="box-1-wala" onclick="toggleSelection(${item.id})">
    <img
      src="${item.images}"
      alt=""
    />
    <p>${item.name}</p>
  </div>
    `;
}

// category Tab Template

function CatTabTemplate(item) {
  // console.log(item);
  return `
  <div class="fruit-tab" onclick="OpenProduct(${item.id})">${item.name}</div>
  `;
}

// load product template 
function loadPro(item) {
  console.log(item);
  // return `
  // <div id="Mango" class="fruit-content">
  // <div class="fruit-wala">
  
  //   <div class="img">
  //     <img src="" alt="">
  
  //   </div>
  //   <p class="para-tank">mango</p>
  //   <span><p>1kg</p> <p>₹120</p></span>
  //   <input type="checkbox" checked>
  
  // </div>
  // `;
}



// load category function 
async function getcat () {
    let req = await fetch("api/api.php?type=GET1", { method: "GET"});
    let res = await req.json();
    console.log(res);
    localStorage.setItem('Setup', JSON.stringify(res));
    res.map(item => $("#displayCat").append(catTemplate(item)))
    }


    var selectarray = [];

    function toggleSelection(element) {
        if (selectarray.includes(element)) {
            Catdeselect(element);
        } else {
            Catselect(element);
        }
    }
  
    function Catselect(element) {
        if (!selectarray.includes(element)) {
            selectarray.push(element);
            console.log("Selected:", selectarray);
        }
    }
  
    function Catdeselect(element) {
        var index = selectarray.indexOf(element);
        if (index !== -1) {
            selectarray.splice(index, 1);
            console.log("Deselected:", selectarray);
        }
    }
    
    function addSelection(){
      localStorage.setItem('selCat',selectarray);
      location.href="part3.html";
    }


   function loadCattab() {
    var GetData = JSON.parse(localStorage.getItem("Setup"));
    GetData.forEach(item => $("#fruitTabs").append(CatTabTemplate(item)));
}

async function OpenProduct(id){
  let formData = new FormData();
  formData.append('type', 'getPro');
  formData.append('id', id);
      let req = await fetch("api/api.php", {method: "POST",  body:formData});
      let res = await req.json();
      console.log(res);
      res.map(item => $("#ShowCasePro").append(loadPro(item)))
      
}