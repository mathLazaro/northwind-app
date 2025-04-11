function renderSelectElement(uri, elementId, formatOption) {
    const select = document.getElementById(elementId);
    const url = `http://localhost:5000/${uri}`;
    fetch(url)
        .then((res) => {
            return res.json();
        })
        .then((data) => {
            data.forEach((element) => {
                const option = formatOption(element);
                select.appendChild(option);
            });
        })
        .catch((error) => {
            console.log(`Erro ao renderizar select de id "${elementId}":`, error);
        });
}

// renderiza todos os selects
document.addEventListener("DOMContentLoaded", () => {
    renderSelectElement("customers", "customer", (customer) => {
        const option = document.createElement("option");
        option.value = customer.customerid;
        option.textContent = customer.companyname;
        return option;
    });

    renderSelectElement("employees", "employee", (employee) => {
        const option = document.createElement("option");
        option.value = employee.employeeid;
        option.textContent = employee.firstname + " " + employee.lastname;
        return option;
    });

    renderSelectElement("shippers", "shipper", (shippers) => {
        const option = document.createElement("option");
        option.value = shippers.shipperid;
        option.textContent = shippers.companyname;
        return option;
    });
});
