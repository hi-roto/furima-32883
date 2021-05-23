document.addEventListener('DOMContentLoaded', function (){
  if (document.getElementById('item-image')){
    const imageList = document.getElementById("image-list");
    
    const createImageHTML = (blob) => {   
      const imageElement = document.createElement('div');
      imageElement.setAttribute('class', "image-element")
      let imageElementNum = document.querySelectorAll('.image-element').length

      const blobImage = document.createElement('img');
      blobImage.setAttribute('src', blob);
      blobImage.setAttribute('id', 'add-image');
      
      const inputHTML = document.createElement('input');
      inputHTML.setAttribute('id', `item_image_${imageElementNum}`);
      inputHTML.setAttribute('name', 'image[images][]');
      inputHTML.setAttribute('type', `file`);
      
      imageElement.appendChild(blobImage);
      imageList.appendChild(imageElement);

    };
    
    document.getElementById("item-image").addEventListener("change", function(e){
      const removeContents = document.querySelectorAll("#add-image");
      const removeElements = document.querySelectorAll('.image-element');
      if (removeContents){
        removeContents.forEach(function (removeContent){
          removeContent.remove();
        })
        removeElements.forEach(function (removeElement){
          removeElement.remove();
        })
      }
      const forNum = e.target.files.length
      if (forNum < 5){
      for (let i = 0;i < forNum; i++){
        let file = e.target.files[i];
        let blob = window.URL.createObjectURL(file);
        createImageHTML(blob);
      }}else{
        document.getElementById('item-image').value = "";
      }
    });
  }
});