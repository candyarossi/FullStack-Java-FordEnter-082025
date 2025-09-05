# 📊 Modelo Entidad-Relación 

### 🏢 Entidades principales

* **Restaurantes**

  * id\_restaurante (PK)
  * nombre, dirección, teléfono

* **Mesas**

  * id\_mesa (PK)
  * nro\_mesa (UQ), capacidad, disponibilidad

* **Clientes**

  * id\_cliente (PK)
  * nombre, apellido, dirección, teléfono

* **Facturas**

  * id\_factura (PK)
  * total, método\_pago, fecha
  * id\_cliente (FK → Clientes)

* **Pedidos**

  * id\_pedido (PK)
  * fecha\_hora, estado
  * id\_cliente (FK → Clientes)
  * id\_mesa (FK → Mesas)
  * id\_factura (FK → Facturas)

* **Reservas**

  * id\_reserva (PK)
  * fecha\_hora, cantidad
  * id\_cliente (FK → Clientes)

* **Menus**

  * id\_menu (PK)
  * nombre\_articulo, descripción, precio

* **Cocineros**

  * id\_cocinero (PK)
  * nombre, apellido, especialidad

* **Ingredientes**

  * id\_ingrediente (PK)
  * nombre, stock

* **Preparaciones**

  * id\_preparacion (PK)
  * cantidad, fecha\_preparacion

---

### 🔗 Tablas intermedias (relaciones N\:M)

* **Ingredientes\_Preparaciones**

  * id\_ingrediente (FK → Ingredientes)
  * id\_preparacion (FK → Preparaciones)

* **Preparaciones\_Cocineros**

  * id\_preparacion (FK → Preparaciones)
  * id\_cocinero (FK → Cocineros)

---

### 📌 Relaciones principales

* Un **Cliente** puede tener muchas **Facturas**, **Pedidos** y **Reservas**.
* Un **Pedido** está asociado a un **Cliente**, una **Mesa** y una **Factura**.
* Una **Factura** siempre pertenece a un **Cliente**.
* Una **Preparación** se hace con muchos **Ingredientes** (N\:M).
* Una **Preparación** puede ser realizada por varios **Cocineros** (N\:M).
