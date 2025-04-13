import { showItemOnOrderDisplay } from "./render-items-display.js";

const items_list = []; // variável que controla os items adicionados

export function addItem(item) {
    items_list.push(item);
}

export function removeItem(id) {
    const index = items_list.findIndex((i) => i.productid == id);
    if (index !== -1) {
        items_list.splice(index, 1);
    }
}

export function getItems() {
    return items_list;
}

document.addEventListener("DOMContentLoaded", () => {
    // controla a lógica de produtos adicionados
    document.getElementById("add-item-bttn").addEventListener("click", () => {
        const items = document.getElementById("order-items");
        const inputs = items.querySelectorAll("input");
        const select = items.querySelector("select");

        if (select.value === "") {
            alert(`O produto deve ser selecionado`);
            return;
        }

        if (items_list.findIndex((i) => i.productid == select.value) !== -1) {
            alert(`Produto já adicionado`);
            return;
        }

        let itemToAdd = { productid: select.value };

        // extrai os dados dos forms
        for (const input of inputs) {
            if (
                (input.name === "quantity" || input.name === "unitprice") &&
                Number(input.value) <= 0
            ) {
                alert(`${input.name} deve ser maior que zero.`);
                return;
            }
            itemToAdd[input.name] = Number(input.value);
        }

        showItemOnOrderDisplay(itemToAdd);
        addItem(itemToAdd);
    });
});
