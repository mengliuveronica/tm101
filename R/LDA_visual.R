#' LDA_visual
#' This function helps transform textmineR output to be usable for the LDAvis package 
#' @param model the model output file from the textmineR package
#' @param data_tokenised a data frame that contains three cols: document, word, n
#'
#' @return
#' @export
#'
#' @examples
#' 
LDA_visual <- function(model,data_tokenised){
      
      phi  <- model$phi
      
      theta <-  model$theta
      
      doc.length <-  data_tokenised %>% 
            group_by(document) %>% 
            summarise(doc.length=sum(n)) %>% 
            pull(doc.length)
      
      vocab <-  model$data@Dimnames[[2]]
      
      vocab_tibble = as_tibble(vocab)
      
      temp = data_tokenised %>% 
            group_by(word) %>% 
            summarise(term.frequency=sum(n)) 
      
      term.frequency <-  vocab_tibble %>% 
            left_join(temp,by=c("value"="word")) %>% 
            pull(term.frequency)
      
      list <- list(phi,theta, doc.length,vocab,term.frequency)
      
      names(list) = c("phi","theta","doc.length","vocab","term.frequency")
      
      json = with(list, 
                  LDAvis::createJSON(phi = phi,theta = theta, vocab = vocab,
                             doc.length = doc.length, term.frequency = term.frequency ))
      
      LDAvis::serVis(json, out.dir = "vis", open.browser = TRUE)
      
}
