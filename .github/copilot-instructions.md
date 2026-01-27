# Expense Tracker - AI Coding Guidelines

## Project Overview
This is a Streamlit-based family expense tracking web application. It manages family members' earnings and expenses in-memory, with no database persistence. Data resets on app restart.

## Architecture
- **Core Logic**: `main.py` contains `FamilyExpenseTracker` class managing `FamilyMember` and `Expense` objects
- **UI Layer**: `app.py` implements Streamlit interface with three tabs (Data Entry, Data Overview, Data Visualization)
- **State Management**: Uses Streamlit's `session_state` to persist data during user session
- **Visualization**: Matplotlib pie chart for expense category distribution

## Key Workflows
- **Local Development**: `pip install -r requirements.txt && streamlit run app.py`
- **Docker Deployment**: `docker build -t expense-tracker . && docker run -p 8501:8501 expense-tracker`
- **Infrastructure**: Terraform automates Docker container deployment (see `terraform/` directory)
- **Code Style**: Enforce with `black` formatter

## Coding Patterns
- **Data Entry**: Use `st.expander` for collapsible sections in Data Entry tab
- **Validation**: Raise `ValueError` for invalid inputs (e.g., empty names, zero values)
- **Naming**: Title-case member names and descriptions using `.title()`
- **Expense Categories**: Use predefined list: Housing, Food, Transportation, Entertainment, Child-Related, Medical, Investment, Miscellaneous
- **Merging Logic**: `merge_similar_category()` sums values for same category, updates description
- **Display**: Use `st.columns()` for tabular data, `st.metric()` for totals
- **Deletion**: Implement delete buttons with `st.rerun()` to refresh UI

## Dependencies
- **Streamlit**: Core web framework
- **streamlit-option-menu**: Horizontal navigation tabs
- **matplotlib**: Pie chart visualization
- **Terraform + Docker**: Infrastructure as code for containerized deployment

## Conventions
- No database; all data in-memory via session state
- Hardcoded expense categories in `app.py` selectbox
- CSS styling loaded from `styles/main.css`
- Port 8501 for both local and containerized runs</content>
<parameter name="filePath">/home/shubham/Desktop/python/Expense-Tracker/.github/copilot-instructions.md