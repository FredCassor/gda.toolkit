#' confiance
#'
#' Les données sont extraites des enquêtes initiées par le CEVIPOF (Centre de recherches politiques de Sciences-Po Paris) lancées en 2009 et répétées chaque année. Les données comprennent l'année de l'enquête et 26 questions de la confiance des Français dans les institutions, le personnel politique, dans les autres pour 8069 répondants.
#'
#' @docType data
#' @keywords dataset
#'
#' @format Un data frame avec 8069 individus and 27 variables (numériques):
#' \describe{
#'   \item{Annee}{Année de l'enquête}
#'   \item{CMunicipal }{Confiance dans le conseil municipal}
#'   \item{CGeneral }{Confiance dans le conseil départemental}
#'   \item{CRegional }{Confiance dans le conseil régional}
#'   \item{AssembleeNationale }{Confiance dans l'assemblée nationale}
#'   \item{Senat }{Confiance dans le sénat}
#'   \item{Gouvernement }{Confiance dans le gouvernement}
#'   \item{InstitPresident }{Confiance dans l'institution présidentielle}
#'   \item{PartiPol }{Confiance dans les partis politiques}
#'   \item{UE }{Confiance dans l'Union Européenne}
#'   \item{Hopitaux }{Confiance dans les hôpitaux}
#'   \item{SecuSociale }{Confiance dans la sécurité sociale}
#'   \item{Ecole }{Confiance dans les écoles}
#'   \item{Police }{Confiance dans la police}
#'   \item{Justice }{Confiance dans la justice}
#'   \item{Armee }{Confiance dans l'armée}
#'   \item{Syndicats }{Confiance dans les syndicats}
#'   \item{Associations }{Confiance dans les associations}
#'   \item{Medias }{Confiance dans les médias}
#'   \item{Banques }{Confiance dans les banques}
#'   \item{GdesEntreprisesPub }{Confiance dans les grandes entreprises publiques}
#'   \item{GdesEntreprisesPriv }{Confiance dans les grandes entreprises privées}
#'   \item{PME }{Confiance dans les petites et moyennes entreprises}
#'   \item{Voisins }{Confiance dans vos voisins}
#'   \item{Gens1erefois }{Confiance dans les gens qu'on rencontre pour la première fois}
#'   \item{GensAutrNat }{Confiance dans les gens d'une autre nationalité}
#'   \item{GensReligion }{Confiance dans les gens qui ont une opinion sur la religion différente}
#' }
#'
#' @note
#' Les questions de la confiance sont codées sur des échelles de Likert sur 4 points, de tout à fait confiance (1), plutôt confiance (2), plutôt pas confiance (3) à pas du tout confiance (4).
#'
#' @source
#' * \url{https://www.sciencespo.fr/cevipof/fr/etudes-enquetes/barometre-confiance-politique/}
#'
#' @examples
#' # summary
#' summary(confiance)
"confiance"
