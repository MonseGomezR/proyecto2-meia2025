export const roleRestrictions = {
  '/create-product': ['ROLE_ADMIN', 'ROLE_USER'],
  '/admin': ['ROLE_ADMIN'],
  '/cart': ['ROLE_USER'],
  '/checkout': ['ROLE_USER'],
  '/orders': ['ROLE_USER', 'ROLE_ADMIN'],
  '/orders/:guia': ['ROLE_USER', 'ROLE_ADMIN'],
  '/sales': ['ROLE_USER', 'ROLE_ADMIN'],
  '/envios': ['ROLE_LOGISTIC', 'ROLE_ADMIN']
}