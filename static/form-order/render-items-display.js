import {removeItem} from './add-item-handler.js'


function _createActionCol() {
    const col = document.createElement("td");
    const button = document.createElement("button");
    button.textContent = "X";
    button.type = 'button';
    
    button.addEventListener("click", function(event) {
        const row = event.target.parentElement.parentElement;
        const id = Number(row.id.substring(1));
        removeItem(id);
        row.remove();
    });
    col.appendChild(button);
    return col;
}

function _createTextCol(text) {
    const col = document.createElement("td");
    col.textContent = text;
    return col;
}

async function _fetchObject(object, id, dao) {
    const url = `http://localhost:5000/${object}/${id}?dao=${dao}`;
    try {
        const res = await fetch(url);
        const data = await res.json();
        return data;
    } catch (error) {
        console.log(`Erro ao procurar por id do objeto ${object}`, error);
        return null;
    }
}

// mostra o item adicionado para o usuário
export async function showItemOnOrderDisplay(itemToDisplay) {
    const display = document.getElementById("display-items");
    const row = document.createElement("tr");
    const dao = document.querySelector('input[name="dao-option"]:checked').value;
    
    row.id = `p${itemToDisplay.productid}`;

    try {
        const product = await _fetchObject("products", Number(itemToDisplay.productid), dao);
        const category = await _fetchObject("categories", Number(product.categoryid), dao)

        row.appendChild(_createTextCol(product.productname));
        row.appendChild(_createTextCol(category.categoryname));
        row.appendChild(_createTextCol(product.quantityperunit));
        row.appendChild(_createTextCol(itemToDisplay.unitprice));
        row.appendChild(_createTextCol(itemToDisplay.quantity));
        row.appendChild(_createTextCol(itemToDisplay.discount));
        row.appendChild(_createActionCol());
    
        display.appendChild(row);
    } catch (error) {
        console.error("Erro ao exibir item:", error);
    }

}
