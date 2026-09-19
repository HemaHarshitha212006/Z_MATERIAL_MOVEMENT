# Z_MATERIAL_MOVEMENT
Abap program on Z_MATERIAL_MOVEMENT
📦 SAP ABAP Material Movement Report

📌 Project Overview

The Material Movement Report is an SAP ABAP report that displays material movement information using data from the MKPF and MSEG tables.

The report combines material document header data with material movement item data using an INNER JOIN and displays the result in an interactive SALV ALV table.

---

🎯 Project Objective

The main objective of this project is to provide a simple report for viewing material movement details such as:

- Material Document Number
- Document Year
- Document Date
- Posting Date
- Material
- Plant
- Storage Location
- Movement Type
- Quantity

Users can filter the report using selection criteria before displaying the data.

---

🔄 Project Flow

                 MKPF
          Material Document Header
                    |
        ┌───────────┼───────────┐
        ↓           ↓           ↓
     MBLNR       MJAHR       BLDAT
   Doc. No.    Doc. Year   Document Date
                    +
                 BUDAT
              Posting Date
                    |
                    |
                 MSEG
          Material Movement Items
                    |
      ┌─────────────┼─────────────┐
      ↓             ↓             ↓
    MATNR         WERKS         LGORT
   Material       Plant      Storage Location
                    |
                  BWART
              Movement Type
                    |
                  MENGE
                Quantity
                    ↓
              INNER JOIN
                    ↓
              Internal Table
                    ↓
               SALV ALV
                    ↓
              Report Output

---

🗂️ SAP Tables Used

1. MKPF — Material Document Header

MKPF contains header-level information for material documents.

Field| Description
"MBLNR"| Material Document Number
"MJAHR"| Document Year
"BLDAT"| Document Date
"BUDAT"| Posting Date

2. MSEG — Material Document Item

MSEG contains item-level information related to material movements.

Field| Description
"MATNR"| Material
"WERKS"| Plant
"LGORT"| Storage Location
"BWART"| Movement Type
"MENGE"| Quantity

---

🔗 Table Relationship

The report joins MKPF and MSEG using:

MKPF-MBLNR = MSEG-MBLNR
MKPF-MJAHR = MSEG-MJAHR

This connects the material document header with its corresponding material movement items.

---

🔍 Selection Screen

The report provides the following selection criteria:

Selection| Field| Purpose
Material Document| "MKPF-MBLNR"| Filter by material document
Posting Date| "MKPF-BUDAT"| Filter by posting date
Material| "MSEG-MATNR"| Filter by material
Movement Type| "MSEG-BWART"| Filter by movement type

This allows users to retrieve only the required material movement records.

---

📊 ALV Output

The report displays the following information using SALV ALV:

Output Field| Description
Material Doc.| Material Document Number
Document Year| Document Year
Document Date| Document Date
Posting Date| Posting Date
Material| Material Number
Plant| Plant
Storage Loc.| Storage Location
Movement Type| Movement Type
Quantity| Quantity

The ALV provides standard functions such as sorting, filtering, and other interactive report functions.

---

🛠️ Technologies Used

- SAP ABAP
- SAP GUI
- Open SQL
- INNER JOIN
- Internal Tables
- Selection Screens
- SALV ALV
- MKPF
- MSEG

---

🧠 ABAP Concepts Demonstrated

This project demonstrates the following ABAP concepts:

- "SELECT-OPTIONS"
- "START-OF-SELECTION"
- Open SQL
- "INNER JOIN"
- Internal Tables
- Structures using "TYPES"
- Database table access
- SALV ALV using "CL_SALV_TABLE"
- ALV column customization
- ALV optimization
- Exception handling using "TRY...CATCH"
- "CX_SALV_NOT_FOUND"
- "CX_SALV_MSG"

---

▶️ How to Run

1. Open SAP GUI.
2. Go to transaction SE38.
3. Enter the program name:

ZMaterial_Movement

4. Execute the program.
5. Enter the required selection criteria.
6. Execute the report.
7. The material movement data will be displayed in an ALV table.

---

📁 Repository Structure

ZMaterial_Movement/
│
├── README.md
├── ZMATERIAL_MOVEMENT.abap
│
└── screenshots/
    ├── abap_source_code.png
    ├── selection_screen.png
    └── alv_output.png

---

📸 Project Screenshots

1. ABAP Source Code

"ABAP Source Code" (screenshots/abap_source_code.png)

2. Selection Screen

"Selection Screen" (screenshots/selection_screen.png)

3. ALV Output

"ALV Output" (screenshots/alv_output.png)

---

📚 Key Learning

Through this project, I learned how to:

- Retrieve data from multiple SAP tables.
- Understand the relationship between header and item tables.
- Use "INNER JOIN" in ABAP Open SQL.
- Store query results in an internal table.
- Create an interactive ALV report using "CL_SALV_TABLE".
- Customize ALV column headings.
- Handle SALV exceptions using "TRY...CATCH".
- Provide selection criteria for user-based filtering.

---

👩‍💻 Author

Nandini Pamisetty

CSE Undergraduate | Aspiring Software Engineer

---

📌 Project Status

Completed ✅

This project was developed as part of my learning and practical implementation of SAP ABAP reporting and ALV.
