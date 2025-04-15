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
        data["freight"] = Number(data.freight);

        if (!data.shippeddate || !data.requireddate) {
            alert("Data nula!");
            return null;
        }

        if (getItems().length === 0) {
            alert("Adicione um produto");
            return null;
        }

        if (!data.customerid) {
            alert("Adicione um cliente");
            return null;
        }

        if (!data.employeeid) {
            alert("Adicione um vendedor");
            return null;
        }

        if (!data.shipperid) {
            alert("Adicione uma transportadora");
            return null;
        }

        const daoOption = data["dao-option"];
        const url = `http://localhost:5000/orders?dao=${daoOption}`;

        try {
            fetch(url, {
                method: "POST",
                headers: {
                    "Content-Type": "application/json",
                },
                body: JSON.stringify(data),
            })
                .then((res) => {
                    if (res.status === 400) {
                        throw new Error("Erro");
                    }
                    setTimeout(() => {
                        location.reload();
                    }, 3000);
                    alert("Pedido adicionado");
                })
                .catch((error) => {
                    alert(error);
                });
        } catch (error) {
            console.log(`Erro ao enviar formulario: `, error);
            return null;
        }
    });
});
