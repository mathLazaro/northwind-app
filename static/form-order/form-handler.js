import { getItems } from "./add-item-handler.js";

// função responsável por enviar o formulário
document.addEventListener("DOMContentLoaded", () => {
    document.querySelector("form").addEventListener("submit", function (event) {
        event.preventDefault();
        const formData = new FormData(this);
        const data = Object.fromEntries(formData.entries());

        delete data.discount;
        delete data.quantity;
        delete data.productid;
        delete data.unitprice;

        data["items"] = getItems();

        const daoOption = data["dao-option"];
        const url = `http://localhost:5000/orders?dao=${daoOption}`;        

        try {
            fetch(url, {
                method: "POST",
                headers: {
                    "Content-Type": "application/json",
                },
                body: JSON.stringify(data),
            }).then(() => {
                setTimeout(() => {
                    location.reload();
                }, 3000);
                alert("Pedido adicionado");
            });
        } catch (error) {
            console.log(`Erro ao enviar formulario: `, error);
            return null;
        }
    });
});
